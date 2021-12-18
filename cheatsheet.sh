
#########################################################################
#  install node.js                                                      #
#########################################################################
wget https://deb.nodesource.com/setup_14.x
sudo -E bash ./setup_14.x
sudo apt-get install -y nodejs

#########################################################################
#  create django proj in Windows                                        #
#########################################################################
cd some-bin-dir-for-venv
py -m venv my-django-venv
my-django-venv\Scripts\activate.bat
py -m pip install Django
django-admin --version
cd some-src-dir-for-proj
django-admin startproject my
cd my
django-admin startapp mycalendar
py manage.py runserver
