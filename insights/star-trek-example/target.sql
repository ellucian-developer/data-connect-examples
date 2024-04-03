SELECT
  custom_insights.random_star_trek_episode()
    as episode_title,

  (tr.spriden_last_name || ', ' || tr.spriden_first_name)
    as student_name

FROM
  $trekkies tr