from io import open
from os import path

from setuptools import find_packages, setup

here = path.abspath(path.dirname(__file__))
with open(path.join(here, 'README.md'), encoding='utf-8') as f:
    long_description = f.read()

setup(
    name='SC-SfMLearner',
    version='1.0.0',
    description='Unsupervised Scale-consistent Depth and Ego-motion Learning from Monocular Video (NeurIPS 2019)',
    long_description=long_description,
    long_description_content_type='text/markdown',
    url='https://github.com/JiawangBian/SC-SfMLearner-Release',
    author='Jia-Wang Bian, Zhichao Li, Naiyan Wang, Huangying Zhan, Chunhua Shen, Ming-Ming Cheng, Ian Reid',
    packages=find_packages(include=['sc_sfmlearner', 'sc_sfmlearner.*']),
)
