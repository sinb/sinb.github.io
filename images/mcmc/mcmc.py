import numpy
n = 10000
x_sample = numpy.random.uniform(0., 1., n)
y_sample = x_sample**2
integration = sum(y_sample) / n