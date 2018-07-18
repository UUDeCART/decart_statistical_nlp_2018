select dt.text from 
      (select  dx.subject_id, dx.hadm_id, n.charttime, dx.code, dx.sequence, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'pneumonia', '')))/LENGTH('pneumonia')) as pneumonia, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'infiltrate', '')))/LENGTH('infiltrate')) as infiltrate, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'consolidation', '')))/LENGTH('consolidation')) as consolidation, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'opacity', '')))/LENGTH('opacity')) as opacity, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'opacification', '')))/LENGTH('opacification')) as opacification, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'airspace', '')))/LENGTH('airspace')) as airspace, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'bilateral', '')))/LENGTH('bilateral')) as bilateral, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'effusion', '')))/LENGTH('effusion')) as effusion, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'opacities', '')))/LENGTH('opacities')) as opacities, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'abnormality', '')))/LENGTH('abnormality')) as abnormality, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'patchy', '')))/LENGTH('patchy')) as patchy, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'aspiration', '')))/LENGTH('aspiration')) as aspiration, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'bibasilar', '')))/LENGTH('bibasilar')) as bibasilar, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'density', '')))/LENGTH('density')) as density, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'infectious', '')))/LENGTH('infectious')) as infectious, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'infection', '')))/LENGTH('infection')) as infection, 
               round((LENGTH(n.text) - LENGTH(REPLACE(n.text, 'parenchymal', '')))/LENGTH('parenchymal')) as parenchymal, 
               n.text 
       from noteevents n 
       join icd9 dx on n.subject_id = dx.subject_id 
                       and n.hadm_id = dx.hadm_id 
                       and n.category = 'RADIOLOGY_REPORT' 
       where (1 = 1) 
             and dx.sequence = 1 
             and (dx.code = '480.0' 
                    or dx.code = '480.1' 
                    or dx.code = '480.2' 
                    or dx.code = '480.3' 
                    or dx.code = '480.8' 
                    or dx.code = '480.9' 
                    or dx.code = '481' 
                    or dx.code = '482.0' 
                    or dx.code = '482.1' 
                    or dx.code = '482.2' 
                    or dx.code = '482.30' 
                    or dx.code = '482.31' 
                    or dx.code = '482.32' 
                    or dx.code = '482.39' 
                    or dx.code = '482.40' 
                    or dx.code = '482.41' 
                    or dx.code = '482.49' 
                    or dx.code = '482.81' 
                    or dx.code = '482.82' 
                    or dx.code = '482.83' 
                    or dx.code = '482.89' 
                    or dx.code = '482.9' 
                    or dx.code = '483.0' 
                    or dx.code = '483.1' 
                    or dx.code = '483.8' 
                    or dx.code = '484.1' 
                    or dx.code = '484.3' 
                    or dx.code = '484.5' 
                    or dx.code = '484.6' 
                    or dx.code = '484.7' 
                    or dx.code = '484.8' 
                    or dx.code = '485' 
                    or dx.code = '486' 
                    or dx.code = '487.0' 
                    or dx.code = '487.1')) dt 
where (dt.pneumonia + dt.infiltrate + dt.consolidation + dt.opacity + dt.opacification + dt.airspace + dt.bilateral + dt.effusion + 
       dt.opacities + dt.abnormality + dt.patchy + dt.aspiration + dt.bibasilar + dt.density + dt.infectious + dt.infection + 
       dt.parenchymal) > 0 
order by (dt.pneumonia + dt.infiltrate + dt.consolidation + dt.opacity + dt.opacification + dt.airspace + dt.bilateral + dt.effusion + 
          dt.opacities + dt.abnormality + dt.patchy + dt.aspiration + dt.bibasilar + dt.density + dt.infectious + dt.infection + 
          dt.parenchymal) desc 
limit 3000 
