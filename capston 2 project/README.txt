{\rtf1\ansi\ansicpg1252\cocoartf2636
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fswiss\fcharset0 Arial-BoldMT;\f2\froman\fcharset0 Times-Roman;
\f3\fswiss\fcharset0 ArialMT;}
{\colortbl;\red255\green255\blue255;\red25\green28\blue31;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c12941\c14510\c16078;\cssrgb\c0\c0\c0;}
\margl1440\margr1440\vieww28600\viewh15060\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 # Springboard Capstone Project\
\
## Breast Cancer Survival Prediction \
\
\pard\pardeftab720\partightenfactor0

\f1\b \cf2 \expnd0\expndtw0\kerning0
\ul \ulc2 \outl0\strokewidth0 \strokec2 Introduction
\f2\b0 \cf0 \ulnone \strokec3 \

\f3 \cf2 \strokec2 The most important information that usually patients diagnosed with breast cancer want to know is how long they will survive. Patients with different criteria when they have been digones can have very different survival rates. The intention of this study is to predict survival rate for patients with different diagnostic criteria.\'a0
\f2 \cf0 \strokec3 \
\

\f1\b \cf2 \ul \ulc2 \strokec2 Dataset
\f2\b0 \cf0 \ulnone \strokec3 \

\f3 \cf2 \strokec2 Dataset that has been used here is {\field{\*\fldinst{HYPERLINK "https://ieee-dataport.org/open-access/seer-breast-cancer-data#files"}}{\fldrslt \ul Seer Breast Cancer Data}}, This dataset of breast cancer patients was obtained from the 2017 November update of the SEER Program of the NCI, which provides information on population-based cancer statistics. The dataset involved female patients with infiltrating duct and lobular carcinoma breast cancer diagnosed in 2006-2010.
\f0 \cf0 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 \
\
## Pipenv\
\
The `Pipefile` has all the python dependencies and requirements you should need. So you can use [Pipenv](https://pipenv-fork.readthedocs.io/en/latest/) is you want to create a seperate python enviornment for this project. \
\
To install pipenv see [here](https://pipenv-fork.readthedocs.io/en/latest/#install-pipenv-today).\
\
To create the env and install the required libraries (once you have pipenv installed) you can just do:\
```\
pipenv install\
```\
\
Then to activate the env and launch jupyter from this env you can do something like the below two commands:\
```\
pipenv shell\
jupyter lab\
```\
}