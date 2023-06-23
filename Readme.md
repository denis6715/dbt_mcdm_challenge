You can see my model, named paid_ads_basic_performance.sql in folder models
Dashboard link https://lookerstudio.google.com/reporting/b0163344-a049-4b24-abc9-65fa971c6060

To include a new data source in a mogel, you need to populate the table and merge with existing data using the UNION ALL command.
The table contains the following fields, let's consider them by meaning:
    add_to_cart - number of additions to the cart
    
    clicks - count of clicks
    
    comments - count of comments
    engagements - different types of interactions such as link clicks, likes, shares, views(post and video) comments and so on
    impressions - count of impressions
    installs - count of installs
    likes - count of likes
    link_clicks - count of clicks on links (field looks like URL_clicks or link_clicks)
    post_click_conversions - calculated by dividing sum of post click by count of target actions (purchase, installation, etc.)
    post_view_conversions - calculated by dividing sum of post views by count of target actions (purchase, installation, etc.)
    posts - count of posts
    purchase - count of purchases
    registrations - count of registrations
    revenue -  total income 
    shares - count of different shares such as repost, retweets and so on 
    spend - count of money spended to posts or views
    total_conversions - count of target actions (purchase, installation, etc.)
    video_views - count of video_views
    ad_id - unique id of ad
    adset_id - unique id of adset
    campaign_id unique id of campaign
    channel - chanel of distribution
    creative_id - unique id of creative
    placement_id - unique id of placement
