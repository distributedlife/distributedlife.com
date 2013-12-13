<?xml version="1.0" encoding="utf-8"?>
<!-- 
  brief:  Transforms the QuickTest Pro results xml-doc into an NUnit format
  author: Ryan Boucher
  date:   2008/02/01
-->
<xsl:stylesheet version="2.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" >
  
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <test-results>
      <xsl:attribute name="name"><xsl:value-of select="Report/Doc/DName"/></xsl:attribute>
      <xsl:attribute name="total"><xsl:value-of select="Report/Doc/Summary/@passed + Report/Doc/Summary/@failed + Report/Doc/Summary/@warnings"/></xsl:attribute>
      <xsl:attribute name="failures"><xsl:value-of select="Report/Doc/Summary/@failed"/></xsl:attribute>
      <xsl:attribute name="not-run">0</xsl:attribute>
      <xsl:attribute name="date"><xsl:value-of select="substring(Report/Doc/Summary/@sTime, 1, 10)"/></xsl:attribute>
      <xsl:attribute name="time"><xsl:value-of select="substring(Report/Doc/Summary/@sTime, 14, 10)"/></xsl:attribute>

      <environment>
        <xsl:attribute name="nunit-version">N/A</xsl:attribute>
        <xsl:attribute name="clr-version">N/A</xsl:attribute>
        <xsl:attribute name="os-version"><xsl:value-of select="Report/General/@os"/></xsl:attribute>
        <xsl:attribute name="platform"><xsl:value-of select="Report/General/@os"/></xsl:attribute>
        <xsl:attribute name="cwd"><xsl:value-of select="Report/General/@productName"/></xsl:attribute>
        <xsl:attribute name="machine-name"><xsl:value-of select="Report/General/@host"/></xsl:attribute>
        <xsl:attribute name="user">N/A</xsl:attribute>
        <xsl:attribute name="user-domain">N/A</xsl:attribute>
      </environment>

      <!--Test Suite / The name of the automation-library-->

      <xsl:for-each select="Report/Doc/DIter">
        <test-suite>
          <xsl:attribute name="name">Iteration #<xsl:value-of select="@iterID"/></xsl:attribute>
          <xsl:attribute name="success">
            <xsl:choose>
              <xsl:when test="Summary/@failed = 0">true</xsl:when>
              <xsl:otherwise>false</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <xsl:attribute name="time">
            <xsl:call-template name="CalculateRunTime">
              <xsl:with-param name="start" select="../Summary/@sTime"/>
              <xsl:with-param name="finish" select="../Summary/@eTime"/>
            </xsl:call-template>
          </xsl:attribute>
          <xsl:attribute name="asserts">N/A</xsl:attribute>

          <!--Test Suite / Each distinct action-->

          <xsl:for-each select="Action">
            <!-- Exclude QuickTest actions that have the word ensure (this is how I identify reuseabile actions) -->
            <xsl:if test="contains (AName, 'ensure') = False">

              <!-- Exclude QuickTest actions that have the word zzRepository as that is our repository storage action-->
              <xsl:if test="contains (AName, 'zzRepository') = False">

                <test-suite>
                  <xsl:attribute name="name"><xsl:value-of select="AName"/></xsl:attribute>
                  <xsl:attribute name="success">
                    <xsl:choose>
                      <xsl:when test="Summary/@failed = 0">true</xsl:when>
                      <xsl:otherwise>false</xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                  <xsl:attribute name="time">
                    <xsl:call-template name="CalculateRunTime">
                      <xsl:with-param name="start" select="Summary/@sTime"/>
                      <xsl:with-param name="finish" select="Summary/@eTime"/>
                    </xsl:call-template>
                  </xsl:attribute>
                  <xsl:attribute name="asserts">N/A</xsl:attribute>

                  <results>
                    <!--Test Cases / Transactions-->
                    <xsl:for-each select="Step">
                      <xsl:call-template name="RecurseStep">
                        <xsl:with-param name="root" select="."/>
                      </xsl:call-template>
                    </xsl:for-each>
                  </results>
                </test-suite>

              </xsl:if>
            </xsl:if>
          </xsl:for-each>
        </test-suite>
      </xsl:for-each>
    </test-results>
  </xsl:template>

  <!--
    Recurses the Step node in an xml document extracting test-case references 
      where certain conditions are found. CheckProperty (used to assert a value
      exists in a QuickTest Pro) and the 'Run Error' to detect other kinds of
      errors.
  
    Ryan Boucher 2008/02/04
  -->
  <xsl:template name="RecurseStep">
    <xsl:param name="root" select="/.." />

    <xsl:for-each select="Step">
      <xsl:call-template name="RecurseStep">
        <xsl:with-param name="root" select="."/>
      </xsl:call-template>
    </xsl:for-each>

    <xsl:if test="NodeArgs/@nType='CheckProperty' or NodeArgs/Disp='Run Error'">
      <test-case>
        <xsl:attribute name="name">
          <xsl:value-of select="NodeArgs/Disp"/>
        </xsl:attribute>
        <xsl:attribute name="executed">true</xsl:attribute>

        <xsl:if test="NodeArgs/@status='Failed'">
          <xsl:attribute name="success">false</xsl:attribute>

          <reason>
            <message>
              <xsl:value-of select="Details"/>
            </message>
          </reason>
        </xsl:if>
        <xsl:if test="NodeArgs/@status='Passed'">
          <xsl:attribute name="success">true</xsl:attribute>
        </xsl:if>

      </test-case>
    </xsl:if>
  </xsl:template>

  <!-- 
      Calculate duration of step/run:
      
                                 123456789012345678901
      QuickTest Pro Date Format: DD/MM/YYYY - HH:MM:SS
    
      This process will not correctly calculate the run-time if it occurs over 
      months or years. If you have an automation script that takes a month to 
      run then you have different issues.
      
      An ideal solution would be to convert the format into the standard XSD 
      dateTime formats, then make use of a 3rd party xslt transform to 
      
      Ryan Boucher 2008/02/04
  -->
  <xsl:template name="CalculateRunTime">
    <xsl:param name="start"/>
    <xsl:param name="finish"/>

    <!-- constants -->
    <xsl:variable name="hoursInDay">24</xsl:variable>
    <xsl:variable name="minutesInDay">1440</xsl:variable>
    <xsl:variable name="minutesInHour">60</xsl:variable>

    <!-- resolve individual dates from supplied strings -->
    <xsl:variable name="startYear" select="substring($start, 7, 4)"/>
    <xsl:variable name="startMonth" select="substring($start, 4, 2)"/>
    <xsl:variable name="startDays" select="substring($start, 1, 2)"/>
    <xsl:variable name="startHours" select="substring($start, 14, 2)"/>
    <xsl:variable name="startMinutes" select="substring($start, 17, 2)"/>
    <xsl:variable name="startSeconds" select="substring($start, 20, 2)"/>

    <xsl:variable name="finishYear" select="substring($finish, 7, 4)"/>
    <xsl:variable name="finishMonth" select="substring($finish, 4, 2)"/>
    <xsl:variable name="finishDays" select="substring($finish, 1, 2)"/>
    <xsl:variable name="finishHours" select="substring($finish, 14, 2)"/>
    <xsl:variable name="finishMinutes" select="substring($finish, 17, 2)"/>
    <xsl:variable name="finishSeconds" select="substring($finish, 20, 2)"/>


    <xsl:variable name="minuteOffset">
      <xsl:call-template name="calculateOffset">
        <xsl:with-param name="start" select="$startSeconds"/>
        <xsl:with-param name="finish" select="$finishSeconds"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="hourOffset">
      <xsl:call-template name="calculateOffset">
        <xsl:with-param name="start" select="$startMinutes"/>
        <xsl:with-param name="finish" select="$finishMinutes"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="dayOffset">
      <xsl:call-template name="calculateOffset">
        <xsl:with-param name="start" select="$startHours"/>
        <xsl:with-param name="finish" select="$finishHours"/>
      </xsl:call-template>
    </xsl:variable>

    <!-- calculate the seconds -->
    <xsl:variable name="durationSeconds">
      <xsl:call-template name="calculateDurationSeconds">
        <xsl:with-param name="startSeconds" select="$startSeconds"/>
        <xsl:with-param name="finishSeconds" select="$finishSeconds"/>
      </xsl:call-template>
    </xsl:variable>

    <!-- calculate the number of whole minutes the test ran without being considered an hour -->
    <xsl:variable name="durationMinutes">
      <xsl:call-template name="calculateDurationMinutes">
        <xsl:with-param name="startMinutes" select="$startMinutes"/>
        <xsl:with-param name="finishMinutes" select="$finishMinutes"/>
        <xsl:with-param name="minuteOffset" select="$minuteOffset"/>
      </xsl:call-template>
    </xsl:variable>

    <!-- calculate the number of whole hours the test ran without being considered a day -->
    <xsl:variable name="durationHours">
      <xsl:call-template name="calculateDurationHours">
        <xsl:with-param name="startHours" select="$startHours"/>
        <xsl:with-param name="finishHours" select="$finishHours"/>
        <xsl:with-param name="hourOffset" select="$hourOffset"/>
      </xsl:call-template>
    </xsl:variable>

    <!-- calculate the number of whole days the test ran for -->
    <xsl:variable name="durationDays">
      <xsl:call-template name="calculateDurationDays">
        <xsl:with-param name="startYear" select="$startYear"/>
        <xsl:with-param name="startMonth" select="$startMonth"/>
        <xsl:with-param name="startDays" select="$startDays"/>
        <xsl:with-param name="finishDays" select="$finishDays"/>
        <xsl:with-param name="dayOffset" select="$dayOffset"/>
      </xsl:call-template>
    </xsl:variable>

    <!-- calculate the total duration in minutes -->
    <xsl:variable name="totalDurationMinutes">
      <xsl:value-of select="($durationDays * $minutesInDay) + ($durationHours * $minutesInHour) + $durationMinutes"/>
    </xsl:variable>

    <!-- Export results to caller -->
    <xsl:value-of select="$totalDurationMinutes"/>.<xsl:value-of select="$durationSeconds"/>
  </xsl:template>

  <!--
  Calculates the difference between two seconds times. 
  -->
  <xsl:template name="calculateDurationSeconds">
    <xsl:param name="startSeconds"/>
    <xsl:param name="finishSeconds"/>

    <!-- constants -->
    <xsl:variable name="secondsInMinute">60</xsl:variable>

    <xsl:choose>
      <xsl:when test="$startSeconds > $finishSeconds">
        <xsl:value-of select="$secondsInMinute - $startSeconds + $finishSeconds"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$finishSeconds - $startSeconds"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="calculateDaysInMonth">
    <xsl:param name="yearAsNumber"/>
    <xsl:param name="monthAsNumber"/>

    <xsl:choose>
      <xsl:when test="$monthAsNumber = 1 or $monthAsNumber = 3 or $monthAsNumber = 5 or $monthAsNumber = 7 or $monthAsNumber = 8 or $monthAsNumber = 10 or $monthAsNumber = 12">
        31
      </xsl:when>
      <xsl:when test="$monthAsNumber = 4 or $monthAsNumber = 6 or $monthAsNumber = 9 or $monthAsNumber = 11">
        30
      </xsl:when>
      <xsl:when test="$monthAsNumber = 2">
        <xsl:choose>
          <xsl:when test="($yearAsNumber % 4) = 0">
            29
          </xsl:when>
          <xsl:otherwise>
            28
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        Invalid Month
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!--
    Used to determine if wrapping of date-components should occur
    If start > finish then wrapping should occur: an offset of 1
    If start <= finish then no wrapping should occur
    
    Ryan Boucher - 2008/04/02
  -->
  <xsl:template name="calculateOffset">
    <xsl:param name="start"/>
    <xsl:param name="finish"/>

    <xsl:choose>
      <xsl:when test="$start > $finish">
        1
      </xsl:when>
      <xsl:otherwise>
        0
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!--
    Used to calculate the difference between two minutes with the
      assumption that they belong to a greater time difference where
      there are seconds impacting the duration and hours to be 
      impacted by the minutes
      
    Note: not suitable for use outside calculateRunTime
    
    Ryan Boucher - 2008/04/02
  -->
  <xsl:template name="calculateDurationMinutes">
    <xsl:param name="startMinutes"/>
    <xsl:param name="finishMinutes"/>
    <xsl:param name="minuteOffset"/>

    <!-- constants -->
    <xsl:variable name="minutesInHour">60</xsl:variable>

    <xsl:choose>
      <!-- 
      if the start minutes is greater than the finish minutes we need 
        to wrap the minutes
      -->
      <xsl:when test="$startMinutes > $finishMinutes">
        <xsl:choose>
          <!--
          If we have an offset (due to seconds wrapping) then incorporate
            into the calculations
          -->
          <xsl:when test="$minuteOffset = 1 and (($minutesInHour - $startMinutes + $finishMinutes) = 0)">
            <xsl:value-of select="$minutesInHour - $minuteOffset"/>
          </xsl:when>
          <xsl:when test="$minuteOffset = 1 and (($minutesInHour - $startMinutes + $finishMinutes) != 0)">
            <xsl:value-of select="$minutesInHour - $startMinutes + $finishMinutes - $minuteOffset"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$minutesInHour - $startMinutes + $finishMinutes"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <!--
          If we have an offset (due to seconds wrapping) then incorporate
            into the calculations
          -->
          <xsl:when test="($minuteOffset = 1) and (($finishMinutes - $startMinutes) = 0)">
            <xsl:value-of select="$minutesInHour - $minuteOffset"/>
          </xsl:when>
          <xsl:when test="($minuteOffset = 1) and (($finishMinutes - $startMinutes) != 0)">
            <xsl:value-of select="$finishMinutes - $startMinutes - $minuteOffset"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$finishMinutes - $startMinutes"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!--
    Used to calculate the difference between two hours with the
      assumption that they belong to a greater time difference where
      there are minutes impacting the duration and days to be 
      impacted by the hours
      
    Note: not suitable for use outside calculateRunTime
    
    Ryan Boucher - 2008/04/02
  -->
  <xsl:template name="calculateDurationHours">
    <xsl:param name="startHours" select="/.."/>
    <xsl:param name="finishHours" select="/.."/>
    <xsl:param name="hourOffset" select="/.."/>

    <!-- constants -->
    <xsl:variable name="hoursInDay">24</xsl:variable>

    <xsl:choose>
      <!-- 
      if the start minutes is greater than the finish minutes we need 
        to wrap the minutes
      -->
      <xsl:when test="$startHours > $finishHours">
        <xsl:choose>
          <!-- 
          If we have an offset (due to seconds wrapping) then incorporate
            into the calculations
          -->
          <xsl:when test="$hourOffset = 1 and ($hoursInDay - $startHours + $finishHours = 0)">
            <xsl:value-of select="$hoursInDay - $hourOffset"/>
          </xsl:when>
          <xsl:when test="$hourOffset = 1 and ($hoursInDay - $startHours + $finishHours != 0)">
            <xsl:value-of select="$hoursInDay - $startHours + $finishHours - $hourOffset"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$hoursInDay - $startHours + $finishHours"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <!-- 
          If we have an offset (due to seconds wrapping) then incorporate
            into the calculations
          -->
          <xsl:when test="$hourOffset = 1 and ($finishHours - $startHours = 0)">
            <xsl:value-of select="$hoursInDay - $hourOffset"/>
          </xsl:when>
          <xsl:when test="$hourOffset = 1 and ($finishHours - $startHours != 0)">
            <xsl:value-of select="$finishHours - $startHours - $hourOffset"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$finishHours - $startHours"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!--
    Used to calculate the difference between two hours with the
      assumption that they belong to a greater time difference where
      there are hours impacting the duration 
      
    Note: not suitable for use outside calculateRunTime
    
    Ryan Boucher - 2008/04/02
  -->
  <xsl:template name="calculateDurationDays">
    <xsl:param name="startYear" select="/.." />
    <xsl:param name="startMonth" select="/.." />
    <xsl:param name="startDays" select="/.." />
    <xsl:param name="finishDays" select="/.." />
    <xsl:param name="dayOffset" select="/.." />

    <xsl:variable name="daysInMonth">
      <xsl:call-template name="calculateDaysInMonth">
        <xsl:with-param name="yearAsNumber" select="$startYear"/>
        <xsl:with-param name="monthAsNumber" select="$startMonth"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:choose>
      <!-- 
      if the start minutes is greater than the finish minutes we need 
        to wrap the minutes
      -->
      <xsl:when test="$startDays > $finishDays">
        <xsl:choose>
          <!-- 
          If we have an offset (due to seconds wrapping) then incorporate
            into the calculations
          -->
          <xsl:when test="$dayOffset = 1 and ($daysInMonth - $startDays + $finishDays = 0)">
            <xsl:value-of select="$daysInMonth - $dayOffset"/>
          </xsl:when>
          <xsl:when test="$dayOffset = 1 and ($daysInMonth - $startDays + $finishDays != 0)">
            <xsl:value-of select="$daysInMonth - $startDays + $finishDays - $dayOffset"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$daysInMonth - $startDays + $finishDays"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <!-- 
          If we have an offset (due to seconds wrapping) then incorporate
            into the calculations
          -->
          <xsl:when test="$dayOffset = 1 and ($finishDays - $startDays = 0)">
            <xsl:value-of select="$daysInMonth - $dayOffset"/>
          </xsl:when>
          <xsl:when test="$dayOffset = 1 and ($finishDays - $startDays != 0)">
            <xsl:value-of select="$finishDays - $startDays - $dayOffset"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$finishDays - $startDays"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>