Чтобы создать рабочее окружение, надо выполнить следующие команды:

.. code-block:: sh

   sudo mkdir -p /opt/odoo-projects
   sudo chown $USER:$USER /opt/odoo-projects
   cd /opt/odoo-projects

   # используем репозиторий с рабочим окружение
   git init
   git remote add origin https://github.com/em230418/odoo-work-environment.git
   git fetch
   git checkout origin/master -ft

   # допустим будем работать с версией 15.0
   export ODOO_VERSION=15.0

   # клонируем репозиторий odoo нужной версии
   # первый запуск будет долгим
   ./clone_odoo.sh $ODOO_VERSION

   # создаем docker-образ
   ./build_docker_image.sh $ODOO_VERSION

   # проделываем тоже самое с другими версиями odoo
