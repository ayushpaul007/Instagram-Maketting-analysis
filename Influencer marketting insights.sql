create database instagram_marketting;
Use instagram_marketting;


-- 1. Which niche has the highest average engagement rate?

SELECT niche,
ROUND(AVG(engagement_rate), 2) AS avg_engagement
FROM indian_influencers_final
GROUP BY niche
ORDER BY avg_engagement DESC;

-- 2. Which niche delivers the best ROI?

SELECT niche,
ROUND(AVG(roi_score), 2) AS ROI
FROM indian_influencers_final
GROUP BY niche
ORDER BY ROI DESC;

-- 3. Do influencers with higher followers have lower engagement?

SELECT 
name,
followers,
engagement_rate,
CASE 
    WHEN followers > 500000 and engagement_rate > (
        SELECT AVG(engagement_rate)
        FROM indian_influencers_final
    )
    THEN 'Yes'
    ELSE 'No'
END AS above_avg_engagement
FROM indian_influencers_final;

-- 4. Which city has the highest concentration of influencers?

select city , count(*) as total_influencers FROM indian_influencers_final
group by city order by count(*) desc;

-- 5. Which top 20 influencers provide the highest ROI?

select name , roi_score FROM indian_influencers_final
order by roi_score desc limit 20 ;

-- 6. Which niche + secondary niche combination performs best?
select niche , secondary_niche , round(avg(engagement_rate), 2) as avg_engagement FROM indian_influencers_final
group by niche,secondary_niche order by avg_engagement  desc;

-- 7. Is there a relationship between growth rate and engagement?

SELECT 
growth_rate,
AVG(engagement_rate) AS avg_engagement
FROM indian_influencers_final
GROUP BY growth_rate
ORDER BY growth_rate;

-- 8. Do higher story views correlate with higher engagement?

SELECT 
avg_story_views,
engagement_rate
FROM indian_influencers_final
ORDER BY avg_story_views;

-- 9. Which influencers have high followers but low engagement? 

SELECT 
name,
followers,
engagement_rate
FROM indian_influencers_final
WHERE followers > 500000
AND engagement_rate < (
    SELECT AVG(engagement_rate)
    FROM indian_influencers_final
);

-- 10. Which niche performs best in each city?

SELECT 
city,
niche,
ROUND(AVG(engagement_rate), 4) AS avg_engagement
FROM indian_influencers_final
GROUP BY city, niche
ORDER BY city, avg_engagement DESC;