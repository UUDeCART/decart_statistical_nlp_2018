select dt.text from 
      (select  dx.subject_id, dx.hadm_id, dx.code, dx.sequence, 
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'bronchitis', '')))/LENGTH('bronchitis')) as bronchitis,
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'copd', '')))/LENGTH('copd')) as copd,
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'emphysema', '')))/LENGTH('emphysema')) as emphysema,
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'hypoxia', '')))/LENGTH('hypoxia')) as hypoxia,
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'hyperinflated', '')))/LENGTH('hyperinflated')) as hyperinflated,
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'thickening', '')))/LENGTH('thickening')) as thickening,
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'distress', '')))/LENGTH('distress')) as distress,
                  n.text 
          from noteevents n 
          join icd9 dx on n.subject_id = dx.subject_id 
                      and n.hadm_id = dx.hadm_id
                      and n.category = 'RADIOLOGY_REPORT'
          where (1 = 1)
              and dx.sequence = 1
              and (dx.code = '490'
                 or dx.code = '493'
                 or dx.code = '495'
                 or dx.code = '496'
                 or dx.code = '491'
                 or dx.code = '491.0'
                 or dx.code = '491.1'
                 or dx.code = '491.2'
                 or dx.code = '491.20'
                 or dx.code = '491.21'
                 or dx.code = '491.22'
                 or dx.code = '491.8'
                 or dx.code = '491.9'
                 or dx.code = '492'
                 or dx.code = '492.0'
                 or dx.code = '492.8'
                 or dx.code = '493.2'
                 or dx.code = '496'
                 or dx.code = '518.1'
                 or dx.code = '518.1'
                 or dx.code = '518.2'
                 or dx.code = '770.2'
                 or dx.code = '958.7'
                 or dx.code = 'V81.3'
                 )) dt  
where (bronchitis + copd + emphysema + hypoxia + hyperinflated + thickening + distress) > 0
order by (bronchitis + copd + emphysema + hypoxia + hyperinflated + thickening + distress) desc
limit 500
