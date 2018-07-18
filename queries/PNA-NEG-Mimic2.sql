select dt.text from 
       (select  dx.subject_id, dx.hadm_id, n.charttime, dx.code, dx.sequence, 
                n.text 
        from noteevents n 
        join icd9 dx on n.subject_id = dx.subject_id 
                        and n.hadm_id = dx.hadm_id 
                        and n.category = 'RADIOLOGY_REPORT' 
        where (1 = 1) 
               and dx.sequence = 1 
               and (dx.code != '480.0' 
                     and dx.code != '480.1' 
                     and dx.code != '480.2' 
                     and dx.code != '480.3' 
                     and dx.code != '480.8' 
                     and dx.code != '480.9' 
                     and dx.code != '481' 
                     and dx.code != '482.0' 
                     and dx.code != '482.1' 
                     and dx.code != '482.2' 
                     and dx.code != '482.30' 
                     and dx.code != '482.31' 
                     and dx.code != '482.32' 
                     and dx.code != '482.39' 
                     and dx.code != '482.40' 
                     and dx.code != '482.41' 
                     and dx.code != '482.49' 
                     and dx.code != '482.81' 
                     and dx.code != '482.82' 
                     and dx.code != '482.83' 
                     and dx.code != '482.89' 
                     and dx.code != '482.9' 
                     and dx.code != '483.0' 
                     and dx.code != '483.1' 
                     and dx.code != '483.8' 
                     and dx.code != '484.1' 
                     and dx.code != '484.3' 
                     and dx.code != '484.5' 
                     and dx.code != '484.6' 
                     and dx.code != '484.7' 
                     and dx.code != '484.8' 
                     and dx.code != '485' 
                     and dx.code != '486' 
                     and dx.code != '487.0' 
                     and dx.code != '487.1')) dt 
limit 10000 
