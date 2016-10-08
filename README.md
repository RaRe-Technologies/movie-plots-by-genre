# movie-plots-by-genre
Movie plots by genre tutorial at PyData Berlin 20 May 2016. 

See slides for the narrative.

## Setting Up
Make sure you have Python 3.

- Clone this repository
```
git clone https://github.com/RaRe-Technologies/movie-plots-by-genre.git
```
if you don't have git you can also download a zip of this repo https://github.com/RaRe-Technologies/movie-plots-by-genre/archive/master.zip

- Install virtualenv
```
(sudo) pip install virtualenv
```
- Create a virtual env and install all the requirements.
```
cd movie-plots-by-genre/
virtualenv gensim # if you have both python2 and python3 then use virtualenv -p python3 gensim
source gensim/bin/activate
pip3 install cython gensim sklearn pandas matplotlib nltk pyemd jupyter
```
__NOTE__:On OSX you might want to download [pyemd from github](https://github.com/wmayner/pyemd) and install it via `python3 setup.py install`.

- Download Google News pre-trained word2vec model (1.5 Gb) from [here]( https://drive.google.com/file/d/0B7XkCwpI5KDYNlNUTTlSS21pQmM/edit?usp=sharing)

-  Download nltk data
```
python -m nltk.downloader punkt
```

- Fire up a jupyter notebook
```
jupyter notebook
```


__If you are short on bandwidth__ then you will be able to follow most of the tutorial just with these libraries:

- Python 3
- pip3 install cython gensim sklearn pandas matplotlib nltk pyemd jupyter
- python -m nltk.downloader punkt
