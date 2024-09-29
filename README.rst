======================
Рабочее окружение Odoo
======================

Установка необходимых пакетов
=============================

Для ОС семейства Альт

.. code-block:: sh

   sudo apt-get install git docker-compose-v2 docker-engine python3

Прочие подробности по установке docker в разделе `"Установка" <https://www.altlinux.org/Docker#%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0>`_

.. code-block:: sh

   sudo mkdir -p /opt/odoo-projects
   sudo chown $USER:$USER /opt/odoo-projects
   cd /opt/odoo-projects

   # используем репозиторий с рабочим окружение
   git init
   git remote add origin https://github.com/em230418/odoo-work-environment.git
   git fetch
   git checkout origin/master -ft

Разворачивание для разработки
=============================

.. code-block:: sh

   # допустим будем работать с версией 15.0
   export ODOO_VERSION=15.0

   # клонируем репозиторий odoo нужной версии
   # первый запуск будет долгим
   ./clone_odoo.sh $ODOO_VERSION

   # создаем виртуальное окружение
   ./make_venv.sh $ODOO_VERSION

   # создаем docker-образ
   ./build_docker_image.sh $ODOO_VERSION

   # проделываем тоже самое с другими версиями odoo

Разворачивание для боевого применения
=====================================

TODO
