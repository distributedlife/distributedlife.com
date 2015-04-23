echo `git rev-parse HEAD` > source/version.html
bundle install
bundle exec middleman build
cd build
s3cmd sync --acl-public --guess-mime-type --recursive . s3://distributedlife.com/
s3cmd modify --acl-public --guess-mime-type --recursive --add-header="Vary: Accept-Encoding" --add-header="Cache-Control:public" s3://distributedlife.com/images/
s3cmd modify --acl-public --guess-mime-type --recursive --add-header="Vary: Accept-Encoding" s3://distributedlife.com/javascripts/
s3cmd modify --acl-public --guess-mime-type --recursive --add-header="Vary: Accept-Encoding" s3://distributedlife.com/stylesheets/
s3cmd modify --acl-public --guess-mime-type --recursive --add-header="Content-Type: utf-8" s3://distributedlife.com/index.html
cd ..
rm -rf build