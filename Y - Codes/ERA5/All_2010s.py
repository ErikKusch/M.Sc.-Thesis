import cdsapi
 
c = cdsapi.Client()
c.retrieve('reanalysis-era5-complete', {    # do not change this!
    'class'   : 'ea',
    'expver'  : '1',
    'stream'  : 'moda',
    'type'    : 'an',
    'param'   : '39.128/40.128/41.128/42.128/167.128',
    'levtype' : 'sfc',
           'date'    : '20100101/20100201/20100301/20100401/20100501/20100601/20100701/20100801/20100901/20101001/20101101/20101201/20110101/20110201/20110301/20110401/20110501/20110601/20110701/20110801/20110901/20111001/20111101/20111201/20120101/20120201/20120301/20120401/20120501/20120601/20120701/20120801/20120901/20121001/20121101/20121201/20130101/20130201/20130301/20130401/20130501/20130601/20130701/20130801/20130901/20131001/20131101/20131201/20140101/20140201/20140301/20140401/20140501/20140601/20140701/20140801/20140901/20141001/20141101/20141201/20150101/20150201/20150301/20150401/20150501/20150601/20150701/20150801/20150901/20151001/20151101/20151201/20160101/20160201/20160301/20160401/20160501/20160601/20160701/20160801/20160901/20161001/20161101/20161201',
    'decade'  : '2010',
}, 'All_2010s.grib')
