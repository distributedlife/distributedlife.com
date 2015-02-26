echo `git rev-parse HEAD` > source/version.html
bundle exec middleman build
cd build
s3cmd sync --acl-public --guess-mime-type --recursive . s3://distributedlife.com/
s3cmd modify --acl-public --guess-mime-type --recursive --add-header="Vary: Accept-Encoding" --add-header="Cache-Control:public" --add-header='Content-Encoding: gzip' s3://distributedlife.com/images/
s3cmd modify --acl-public --guess-mime-type --recursive --add-header="Vary: Accept-Encoding" --add-header="Content-Type: utf-8" --add-header='Content-Encoding: gzip' s3://distributedlife.com/**/*.html
cd ..
rm -rf build