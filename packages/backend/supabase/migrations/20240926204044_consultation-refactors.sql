UPDATE public.company_presets
SET even_configuration = '{group_hybrid}',
    odd_configuration = '{group_hybrid}'
WHERE name = 'Consultation';
