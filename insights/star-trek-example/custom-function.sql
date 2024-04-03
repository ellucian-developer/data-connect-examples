DECLARE
    episode_title VARCHAR(100);
BEGIN
  SELECT title INTO episode_title
  FROM star_trek_episodes
  ORDER BY random()
  LIMIT 1;
  RETURN episode_title;
END;