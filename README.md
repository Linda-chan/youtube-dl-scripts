# youtube-dl Scripts

Эти скрипты предназначены для запуска [youtube-dl](http://youtube-dl.org) с некоторыми полезными параметрами. Разделение идёт по качеству запрашиваемого видео и использованию прокси.

Все скрипты представлены в двух версиях: BAT файлы для Windows и скрипты для bash (Linux и тому подобное). В основном они идентичны, но Windows версия ориентирована на портабельность. Вот несколько отличий:

- Windows версия ищет файл youtube-dl.exe в каталоге с BAT файлом, в то время как Linux версия считает, что youtube-dl установлен где-то в системе.

- Windows версия ищет [ffmpeg](https://ffmpeg.zeranoe.com/builds/win32/static/) в каталоге с BAT файлом (точнее, «ffmpeg\bin»), в то время как Linux версия считает, что ffmpeg установлен где-то в системе.

- Windows версия ищет [AtomicParsley](http://atomicparsley.sourceforge.net) в каталоге с BAT файлом (точнее, «AtomicParsley»), в то время как Linux версия считает, что AtomicParsley установлен где-то в системе.

При запуске скрипта переменная HOME переписывается каталогом скрипта. Таким образом файл [.netrc](https://github.com/rg3/youtube-dl#authentication-with-netrc-file) (с логинами и паролями) берётся из каталога скрипта. То же относится и к каталогу .cache, который создаётся при скачке видео с YouTube.

Обратите внимание, что Linux версия скрипта использует команду readlink для получения каталога скрипта. Таким образом использование симлинков на файлы скриптом становится невозможным – скрипт всегда будет устанавливать в HOME каталог оригинального файла, а не симлинка. В Windows такой проблемы нет.

Настройки прокси берутся из системы. В Windows это – настройки Internet Explorer («Свойства обозревателя» или что-то такое в Панели управления), в Linux – переменная HTTP_PROXY. Если в системе прокси не определён, то соединение производится напрямую.

## Формат имени файла скрипта

Имя файла скрипта выглядит примерно так:

> youtube-dl-XX-YY.ZZ

Где:

- XX – вариант прокси:

	- **np** – прямое соединение.
	- **prx** – системный прокси.

- YY – качество видео (можно воспринимать как «степень сжатия»):

	- **c0** – лучшее.
	- **c5** – среднее (YouTube, см. ниже).
	- **c9** – худшее.
	- **ytcombo** – такой вариант скрипта вызывает другие (за исключением «audio»), пытаясь скачать видео во всех трёх вариантах качества от худшего до лучшего. Применяется для YouTube.
	- **audio** – извлечение аудио. Программа попытается скачать аудиофайл лучшего качества, а если это не получится, то видеофайл со звуковой дорожкой лучшего качества. В итоговый файл данные конвертируются при помощи ffmpeg. Если он отсутствует, программа оставит то, что прислал сервер.
	- **update** – особый случай. Этот файл ничего не качает, а просто пытается обновить youtube-dl до последней версии и создаёт файл youtube-dl.txt со справкой по параметрам программы.

- ZZ – расширение:

	- **bat** – Windows BAT файл.
	- **sh** – bash скрипт.

Например:

> youtube-dl-prx-c9.bat

BAT файл для Windows, качающий видео худшего качества через прокси.

## Качество видео

### c0

youtube-dl автоматически выбирает лучшее качество из того, что предложит сервер. На YouTube обычно это – MP4. На других серверах может быть по-разному.

### c5

Этот вариант работает только с YouTube и основывается на предположении, что видео лучшего качества отдаётся в MP4, худшего – в 3gp, а среднего – в Webm. Таким образом скрипт запрашивает не определённое качество, а формат – Webm, который, как предполагается, и содержит видео среднего качества.

**Внимание!** То и дело мне попадаются ролики, у которых вариант с лучшим качеством отдаётся не в MP4, а в Webm, так что будьте бдительны!

### c9

youtube-dl автоматически выбирает худшее качество из того, что предложит сервер. На YouTube обычно это – 3gp (для старых мобильных телефонов). На других серверах может быть по-разному.

**Внимание!** На серверах отличных от YouTube худшего качества может не быть (ролик может быть в одном варианте вообще), и youtube-dl скачает то, что есть. Тем, что есть может оказаться то же видео в HD качестве.

Так же на серверах отличных от YouTube худшее качество может быть в том же формате, что и лучшее, например, в MP4. Поэтому файлы обоих вариантов будут иметь одинаковое имя.

Будьте бдительны!

## Маленький копирайт

1. Программа и исходный код распространяются бесплатно.

2. Вы имеете право распространять их на тех же условиях.

3. Вы не имеете права использовать имя автора после модификации исходного кода.

4. При этом желательно указывать ссылку на автора оригинальной версии исходного кода.

5. Вы не имеете права на платное распространение исходного кода, а также программных модулей, содержащих данный исходнй код.

6. Программа и исходный код распространяются как есть. Автор не несёт ответственности за любые трагедии или несчастные случаи, вызванные использованием программы и исходного кода.

7. Для любого пункта данного соглашения может быть сделано исключение с разрешения автора программы.

8. По любым вопросам, связанным с данной программой, обращайтесь по адресу lindaoneesama@gmail.com