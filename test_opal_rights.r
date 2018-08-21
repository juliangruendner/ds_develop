library('opal')

o <- opal.login('test', 'test123', 'http://localhost:8880')
# Assign one variable to a R symbol

opal.table(o, 'test', 'LifeLines')
opal.assign(o, 'GEWICHT', 'test.LifeLines:GEWICHT')
opal.execute(o, 'summary(GEWICHT)')


opal.valueset(o, 'test', 'LifeLines', '10003776')