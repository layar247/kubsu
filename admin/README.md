В этом каталоге должны располагаться результаты промежуточных заданий. Всего их 5:

- задачи по bash
- прохождение курса hackthebox
- решение регулярок
- Dockerfile с небольшим проектом
- CI/CD для проекта с предыдущего шага

Ниже описано каждое задание подробнее.

## Авторизация по ключу

Вход по паролю будет отключён 01.05.2023. До этого времени необходимо настроить авторизацию по ключу.

## bash

Необходимо реализовать набор скриптов:

1. Скрипт, который раз в секунду забирает среднюю загрузку системы из /proc/loadavg и сохраняет в файл в течение определённого времени. Имя файла и таймфрейм задаются в качестве аргумента. Каждая строка в результирующем файле должна иметь вид `dd.mm.yy hh:mi = <вывод /proc/loadavg>`.
2. Скрипт, который принимает путь в качестве аргумента и создаёт набор файлов с названием подкаталогов в указанном пути и содержимым числом элементов в этом подкаталоге. Обработать ошибку, если путь не существует.
3. Подсчитать количество строк в файлах, переданных как параметры. Пример вызова: `./lcc.sh .bash_history .bashrc /etc/passwd`. Обработать ошибку, если файла не существует.
4. Скрипту передаётся название планеты как аргумент, вывести количество спутников. Обработать ошибку в названии планеты (сказать, что такой не существует).
5. Для всех файлов в каталоге /var/log, которые заканчиваются на .log, получить последнюю строчку и сохранить в файл logs.log.
6. Написать скрипт, который будет ждать появления файла в текущем каталоге. Как только файл появится, вывести об этом сообщение. Запретить выполнение скрипта, если переменная окружения FOO равна 5 и переменная окружения BAR равна 1.
7. Для каждого пути в PATH вывести его название и количество регулярных файлов в нём. Если каталога не существует, пропустить его. Если каталог симлинк, пропустить его.
8. Проверить, что все переменные окружения для локализации (начинаются на "LC_") имеют одинаковое значение. Если это не так, сообщить кодом возврата 1.

## hackthebox

Необходимо зарегистрироваться на сайте [Hack the Box Academy](https://academy.hackthebox.com/), пройти курс [Linux Fundamentals](https://academy.hackthebox.com/module/details/18) и положить в каталог скриншот завершённого прогресса.

## Регулярки

Необходимо зарегистрироваться на сайте [RegexCrossword](https://regexcrossword.com/), пройти модули "Double Cross" и "Cities" и положить в каталог скриншот завершённого прогресса.

## Docker

`psql -h 127.0.0.1 -p 5432 -U kubsu -W`

Написать приложение, которое будет ходить в БД Postgres на этой машине с кредами user/user и выводить все записи из таблицы users.

Опционально в проекте должны быть:

- Taskfile/Makefile для быстрого запуска всех команд
- тест на этот единственный эндпоинт
- docker-compose для удобства локальной разработки (не для сервера)

## CI/CD

Настроить на любом CI/CD pipeline из 3х шагов, которые должны запускаться на каждый коммит в master:

- сборка Docker-образа
- запуск в нём тестов и линтеров
- деплой проекта на эту машину