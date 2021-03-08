#!/bin/dash

pip install -e /openedx/requirements/free-text-response

cd /openedx/requirements/free-text-response
cp /openedx/edx-platform/setup.cfg .
mkdir test_root
cd test_root/
ln -s /openedx/staticfiles .

cd /openedx/requirements/free-text-response

DJANGO_SETTINGS_MODULE=lms.envs.test EDXAPP_TEST_MONGO_HOST=mongodb pytest freetextresponse/tests.py

rm -rf test_root
