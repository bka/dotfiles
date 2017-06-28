# sudo apt-get install tig
# sudo apt-get install ack-grep
# sudo apt-get install curl
# sudo apt-get install vim-gtk
# sudo apt-get install ack-grep
# sudo apt-get install vim-nox

# git submodule init
# git submodule update

#git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
#~/.fzf/install

# gem install tmuxinator --no-ri --no-rdoc

curl -o bin/phpcs -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar
chmod +x bin/phpcs

curl -o bin/php-cs-fixer -OL http://get.sensiolabs.org/php-cs-fixer.phar
chmod +x bin/php-cs-fixer

curl -o bin/phpcbf -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar
chmod +x bin/phpcbf

curl -o bin/phpmd -OL http://static.phpmd.org/php/latest/phpmd.phar
chmod +x bin/phpmd

curl -o bin/phpunit -OL https://phar.phpunit.de/phpunit.phar
chmod +x bin/phpunit
