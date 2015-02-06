echo `git rev-parse HEAD` > source/version.html
bundle exec middleman build
cd build
s3cmd sync --acl-public --guess-mime-type --recursive . s3://distributedlife.com/
s3cmd modify --acl-public --guess-mime-type --recursive --add-header="Cache-Control:public" s3://distributedlife.com/images/
cd ..
rm -rf build