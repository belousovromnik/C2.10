# C2.10
проект "голосование"

Запуск и проверка.
1. Скопировать папку SRC
2. для запуска сервера запустить из src\backend файл main.py - например так - py main.py
3. с браузере запустить http://127.0.0.1:8090/

Главная страница отвечает на адреса - /, /index, /home
Страница статистики отвечает на адреса - /stat

переход между страницами доступен по ссылкам.
После нажатия на кнопку голосования выводится ответ от сервера.

На странице статистики сознательно отказался от прогресс-баров, рекомендуемых в задании, так так при такой величине значений и при их небольшом разбросе три прогресс-бара выглядят практически одинаково, что выходит не информативно, по моему мнению. Заменил вывод значений на просто цифры. За отсутствие прогресс-баров прошу оценку не снижать, это сознательное изменения задания.
