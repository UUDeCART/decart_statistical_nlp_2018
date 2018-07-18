select dt.text from 
      (select  dx.subject_id, dx.hadm_id, dx.code, dx.sequence,  
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'hyperinflated', '')))/LENGTH('hyperinflated')) as hyperinflated,
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'pulmonary edema', '')))/LENGTH('pulmonary edema')) as edema,
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'emphysema', '')))/LENGTH('emphysema')) as emphysema,
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'cardiomegaly', '')))/LENGTH('cardiomegaly')) as cardiomegaly,
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'congestive', '')))/LENGTH('congestive')) as congestive,
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'bronchitis', '')))/LENGTH('bronchitis')) as bronchitis,
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'effusion', '')))/LENGTH('effusion')) as effusion,
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'atelectasis', '')))/LENGTH('atelectasis')) as atelectasis,
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'chf', '')))/LENGTH('chf')) as chf,            
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'pedicle', '')))/LENGTH('pedicle')) as pedicle,            
                  round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'distress', '')))/LENGTH('distress')) as distress,            
                  n.text 
             from noteevents n 
             join icd9 dx on n.subject_id = dx.subject_id 
                         and n.hadm_id = dx.hadm_id
                         and n.category = 'RADIOLOGY_REPORT'
          where (1 = 1)
              and dx.sequence = 1
              and dx.code = '428.0') dt
where (hyperinflated + edema + emphysema + cardiomegaly + congestive + bronchitis + effusion + atelectasis + chf + pedicle + distress) > 0
order by (hyperinflated + edema + emphysema + cardiomegaly + congestive + bronchitis + effusion + atelectasis + chf + pedicle + distress) desc
limit 500
