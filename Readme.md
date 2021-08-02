# Readme for COVID-19.SPb

To cite this repository in publications use:

    Kouprianov, A. (2021). COVID-19.SPb. Coronavirus epidemics in St. Petersburg, Russia: data and scripts.
    URL https://github.com/alexei-kouprianov/COVID-19.SPb

A BibTeX entry for LaTeX users is:

    @Manual{,
        title = {COVID-19.SPb. Coronavirus epidemics in St. Petersburg, Russia: data and scripts},
        author = {Kouprianov, Alexei},
        year = {2021},
        note = {data and R code},
        url = {https://github.com/alexei-kouprianov/COVID-19.SPb},
    }


This repo was created to keep records of the COVID-19 epidemics in St. Petersburg, Russia. The datasets are based on a range of sources: the official reports published by Rospotrebnadzor (Federal Service for Surveillance on Consumer Rights Protection and Human Wellbeing / Russia), Rosstat (Federal State Statistics Service / Russia), and local authorities (St. Petersburg government, Interdepartmental City Council for Prevention of the Spread of a New Coronavirus Infection (COVID-19) in St. Petersburg), and open data resulted from an original research by Yandex N.V.

The datasets stored in this repository were used in *COVID-19 pandemic in Saint Petersburg, Russia: combining surveillance and population-based serological study data in May, 2020 - April, 2021* / Anton Barchuk, Dmitriy Skougarevskiy, Alexei Kouprianov, Daniil Shirokov, Olga Dudkina, Rustam Tursun-zade, Mariia Sergeeva, Varvara Tychkova, Andrey Komissarov, Alena Zheltukhina, Dmitry Lioznov, Artur Isaev, Ekaterina Pomerantseva, Svetlana Zhikrivetskaya, Yana Sofronova, Konstantin Blagodatskikh, Kirill Titaev, Lubov Barabanova, Daria Danilenko
*medRxiv* 2021.07.31.21261428; [doi : 10.1101/2021.07.31.21261428v1](https://doi.org/10.1101/2021.07.31.21261428)

All the datasets stored in this repository are licensed under [Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](https://creativecommons.org/licenses/by-sa/4.0/) license.

## The Data

A general remark on dates used. Majority of the reports containing data of interest were published about noon summarising the data for the evening of the preceding day. The dates in the datasets are adjusted in such a way as to refer to the day the data belong to, and *not* to the day of publication.

`primary` folder:

* `covid.SPb.gov.spb.ru.hospitalization.txt` contains tab-delimited values for:

  * "DATE" : text string in YYYY-MM-DD format (2020-03-02 through 2021-05-28);
  * "HOSPITALIZED.today" : integer, number of hospitaized for a given day, **source:** [GOGOV.ru](https://gogov.ru/articles/covid-hosp-stats);

* `covid.SPb.gov.spb.ru.overview.txt` contains tab-delimited values for:

  * "DATE" : text string in YYYY-MM-DD format (from 2020-12-08 through 2021-06-01);
  * "i" : integer, number of confirmed COVID-19 cases for a given day;
  * "r" : integer, number of recovered for a given day;
  * "o" : integer, number of persons "under observation" for a given day (includes "os");
  * "os" : integer, number of persons "under observation in hospitals" for a given day (part of "o");
  * "h" : integer, number of hospitaized for a given day;
  * "v1.CS" : integer, number of vaccines administered (1st dose), cumulated sum to date;
  * "v2.CS" : integer, number of vaccines administered (2nd dose), cumulated sum to date;

  **Sources:** The data were collected manually from bulletins published by *Interdepartmental City Council for Prevention of the Spread of a New Coronavirus Infection (COVID-19) in St. Petersburg* as MS Word files at the website of the Government of St. Petersburg. See [Appendix A](texts/Appendix.A.txt) for the full list of URLs. The data for Mondays of each week except the last one were derived by subtraction of the sums for TUE--SUN from the week totals published on Mondays instead of regular daily reports.

* `covid.SPb.PCRtests.txt` contains tab-delimited values for:

  * "DATE" : text string in YYYY-MM-DD format (2020-03-29 through 2021-06-16);
  * "TESTS" : integer, number of PCR-tests performed for a given day, **source:** telegram channel [@koronavirusspb](https://t.me/koronavirusspb);

* `covid.SPb.stopkoronavirus.rf.txt` contains tab-delimited values for:

  * "TIME" : text string in YYYY-MM-DD format (2020-02-01 through 2021-06-16);
  * "i" : integer, number of confirmed COVID-19 cases for a given day;
  * "r" : integer, number of recovered for a given day;
  * "d" : integer, number of deaths for a given day;
  * "a" : integer, number of active cases (Active = cumulative CONFIRMED -- (cumulative RECOVERED + cumulative DEATHS)) for a given day;

  **Sources:** The data for "i", "r", and "d" variables from 2020-04-08 on were collected exclusively at [стопкоронавирус.рф](https://стопкоронавирус.рф/information/). Before that date, a wider array of sources was used, predominantly Rospotrebnadzor bulletins and mass media reports quoting from them. See [Appendix B](texts/Appendix.B.txt) for the full list of references for the period preceding the launch of "стопкоронавирус.рф" website.

* `covid.SPb.yandex.activity.points.daily.txt` contains tab-delimited values for:

  * "DATE" : text string in YYYY-MM-DD format (2020-02-17 through 2021-06-25);
  * "Yandex.ACTIVITY.points" : integer, Yandex overall activity points; **source:** [Yandex Big Cities overall activity index](https://yandex.ru/company/researches/2020/cities-activity);
  
  As stated by Yandex, the actvity points are calculated on the basis of usage of Yandex sercvices, Apple open data on users' mobility, and Otonomo data on the car traffic. The activity points vary from 0 (the lowest activity index since the pandemics began) to 100 (the busiest weekday of a typical Febraury --- March).

* `covid.SPb.yandex.wordstat.weekly.txt` contains tab-delimited values for:

  * "REGION" : text string "St. Petersburg";
  * "LOSS.01" : text string "пропало обоняние" (en: olfaction lost), a search query to Yandex search engine;
  * "START.DATE.LOSS.01" : date, text string in DD.MM.YYYY format, Mondays of each week from 07.10.2019 through 07.06.2021;
  * "END.DATE.LOSS.01" : date, text string in DD.MM.YYYY format, Sundays of each week from 13.10.2019 through 13.06.2021;
  * "COUNT.LOSS.01" : integer, number of search queries `LOSS.01` for a given week, **source:** wordstat.yandex.ru for ["пропало обоняние"](https://wordstat.yandex.ru/#!/history?period=weekly&regions=2&words=%D0%BF%D1%80%D0%BE%D0%BF%D0%B0%D0%BB%D0%BE%20%D0%BE%D0%B1%D0%BE%D0%BD%D1%8F%D0%BD%D0%B8%D0%B5);
  * "SHARE.LOSS.01" : numeric, share of search queries `LOSS.01` among all search queries for a given week, **source:** same as `COUNT.LOSS.01`;
  * "LOSS.02" : text string "протеря обоняния" (en: loss of olfaction), a search query to Yandex search engine;
  * "START.DATE.LOSS.02" : date, text string in DD.MM.YYYY format, Mondays of each week from 07.10.2019 through 07.06.2021, same as `START.DATE.LOSS.01`;
  * "END.DATE.LOSS.02" : date, text string in DD.MM.YYYY format, Sundays of each week from 13.10.2019 through 13.06.2021, same as `END.DATE.LOSS.01`;
  * "COUNT.LOSS.02" : integer, number of search queries `LOSS.02` for a given week, **source:** wordstat.yandex.ru for ["протеря обоняния"](https://wordstat.yandex.ru/#!/history?period=weekly&regions=2&words=%D0%BF%D0%BE%D1%82%D0%B5%D1%80%D1%8F%20%D0%BE%D0%B1%D0%BE%D0%BD%D1%8F%D0%BD%D0%B8%D1%8F);
  * "SHARE.LOSS.02" : numeric, share of search queries `LOSS.02` among all search queries for a given week, **source:** same as `COUNT.LOSS.02`;
  * "SATURATION" : text string "сатурация" (en: saturation), a search query to Yandex search engine;
  * "START.DATE.SATURATION" : date, text string in DD.MM.YYYY format, Mondays of each week from 07.10.2019 through 07.06.2021, same as `START.DATE.LOSS.01`;
  * "END.DATE.SATURATION" : date, text string in DD.MM.YYYY format, Sundays of each week from 13.10.2019 through 13.06.2021, same as `END.DATE.LOSS.01`;
  * "COUNT.SATURATION" : integer, number of search queries `SATURATION` for a given week, **source:** wordstat.yandex.ru for ["сатурация"](https://wordstat.yandex.ru/#!/history?period=weekly&regions=2&words=%D1%81%D0%B0%D1%82%D1%83%D1%80%D0%B0%D1%86%D0%B8%D1%8F);
  * "SHARE.SATURATION" : numeric, share of search queries `SATURATION` among all search queries for a given week, **source:** same as `COUNT.SATURATION`;

  **Note.** The early data for the fall of 2019 -- spring of 2020 were kindly shared with me by [Alexandr Dragan](https://www.facebook.com/alexx.dragan).

`derived` folder contains datasets based on the datasets from `primary` folder:

* `spb.combined.daily.txt` contains tab-delimited values for:

  * "TIME" : text string in YYYY-MM-DD format;
  * "CONFIRMED" : integer, number of confirmed COVID-19 cases for a given day;
  * "RECOVERED" : integer, number of recovered for a given day;
  * "DEATHS" : integer, number of deaths for a given day;
  * "ACTIVE" : integer, number of active cases (derived from cumulative CONFIRMED - (cumulative RECOVERED + cumulative DEATHS)) for a given day;
  * "CONFIRMED.spb" : integer, number of confirmed cases according to the City Council for a given day;
  * "HOSPITALIZED.today" : integer, number of hospitaized for a given day;
  * "PCR.tested" : integer, number of PCR-tests performed for a given day;
  * "v1.CS" : integer, number of vaccines administered (1st dose), cumulated sum to date;
  * "v2.CS" : integer, number of vaccines administered (2nd dose), cumulated sum to date;
  * "Yandex.ACTIVITY.points" : numeric, Yandex overall activity point for a given day;

* `spb.combined.weekly.txt` based on `spb.combined.daily.txt` contains tab-delimited values for:

  * "TIME" : text string in YYYY-MM-DD format, provides dates for Sundays of each week;
  * "CONFIRMED" : integer, number of confirmed COVID-19 cases for a given week;
  * "RECOVERED" : integer, number of recovered for a given week;
  * "DEATHS" : integer, number of deaths for a given week;
  * "ACTIVE" : integer, number of active cases to date (derived from cumulative CONFIRMED - (cumulative RECOVERED + cumulative DEATHS));
  * "CONFIRMED.spb" : integer, number of confirmed cases according to the City Council for a given week;
  * "HOSPITALIZED.today" : integer, number of hospitaized for a given week;
  * "PCR.tested" : integer, number of PCR-tests performed for a given week;
  * "v1.CS" : integer, number of vaccines administered (1st dose), cumulated sum to date;
  * "v2.CS" : integer, number of vaccines administered (2nd dose), cumulated sum to date;
  * "Yandex.ACTIVITY.points" : numeric, mean value for daily Yandex overall activity points;

* `spb.excessive.deaths.txt` Contains tab-delimited values for:

  * "TIME" : text string in YYYY-MM-DD format, dates for the last day of each month from 2020-01-31 to 2021-04-30;
  * "spb.deaths_stopkioronavirus.rf" : integer, number of deaths reported by Rospotrebnadzor, monthly;
  * "spb.excessive_to_2019" : integer, based on a subtraction of 2020 total deaths, monthly, from 2019 total deaths, monthly;
  * "spb.excessive_to_mean.5" : numeric, based on a subtraction of 2020 total deaths, monthly, from 2014 -- 2019 mean total deaths, monthly;

  **Sources.** "spb.excessive_to_2019" and "spb.excessive_to_mean.5" are based on monthly reports by Rosstat. See [Appendix C](texts/Appendix.C.txt) for the full list of URLs. 

## The Scripts

* `data.transformation.r` : documents transition of data from primary to derived datasets `spb.combined.daily.txt` and `spb.combined.weekly.txt`;
