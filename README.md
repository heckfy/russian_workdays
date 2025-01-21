# russian_workdays

[![Gem Version](https://badge.fury.io/rb/russian_workdays.svg)](https://badge.fury.io/rb/russian_workdays)
[![Build Status](https://travis-ci.org/heckfy/russian_workdays.svg?branch=master)](https://travis-ci.org/heckfy/russian_workdays)
[![Code Climate](https://codeclimate.com/github/heckfy/russian_workdays/badges/gpa.svg)](https://codeclimate.com/github/heckfy/russian_workdays)

Производственный календарь РФ

## Установка

Выполняем в терминале:

    gem install russian_workdays

и подгружаем:

```ruby
require "russian_workdays"
```

## Использование

#### Класс RussianWorkdays::Collection

Инициализатор принимает массив или интервал дат.

```ruby
collection = RussianWorkdays::Collection.new((Date.new(2014, 2, 10)..Date.new(2014, 3, 10)))
# Получить массив с выходными днями c 10 февраля 2014 по 10 марта 2014:
collection.holidays
# Получить массив с предпраздничными днями:
collection.preholidays
# Получить массив с рабочими днями:
collection.works
# Получить количество рабочих часов:
collection.work_hours_count
# В качестве аргумента метод work_hours_count принимает количество рабочих часов в неделю, по умолчанию это 40 часов. Получить количество рабочих часов при 36-часовой рабочей неделе:
collection.work_hours_count(36)
```

#### Класс RussianWorkdays::Year

Инициализатор принимает в качестве параметра год. Имеет те же методы что и RussianWorkdays::Collection.

```ruby
collection = RussianWorkdays::Year.new(2014)
# Получить массив с выходными днями в 2014 году:
collection.holidays
```

#### Класс RussianWorkdays::Month

Инициализатор принимает первым параметром год, вторым - номер месяца. Имеет те же методы что и RussianWorkdays::Collection.

```ruby
collection = RussianWorkdays::Month.new(2014, 2)
# Получить массив с выходными днями в феврале 2014 года:
collection.holidays
```

#### Класс RussianWorkdays::Day

Предназначен для работы с одной датой. В качестве параметра принимает объект класса Date.

```ruby
date = RussianWorkdays::Day.new(Date.new(2014, 10, 5))
# Является ли дата выходным днем?
date.holiday?
# Является ли дата предпраздничным днем?
date.preholiday?
# Является ли дата рабочим днем?
date.work?
```

#### Обновление списка рабочих и праздничных дней на новый год
В файле lib/russian_workdays/dates.yml содержится перечень праздничных, предпраздничных и рабочих дней на текущий год. Для каждого следующего года необходимо актуализировать данный файл.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/russian_workdays/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
