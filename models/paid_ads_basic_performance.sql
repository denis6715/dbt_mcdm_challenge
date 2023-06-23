{{ config(materialized = "table", schema = "seeds", alias = "paid_ads_basic_performance") }}

with
    bing as (

        select
            date,
            null as add_to_cart,
            clicks,
            null as comments,
            null as engagements,
            imps as impressions,
            null as installs,
            null as likes,
            null as link_clicks,
            null as post_click_conversions,
            null as post_view_conversions,
            null as posts,
            null as purchase,
            null as registrations,
            revenue,
            null as shares,
            spend,
            conv as total_conversions,
            null as video_views,
            ad_id,
            adset_id,
            campaign_id,
            channel,
            null as creative_id,
            null as placement_id

        from {{ ref("src_ads_bing_all_data") }}

    ),

    facebook as (

        select
            date,
            add_to_cart,
            clicks,
            comments,
            (inline_link_clicks + views + likes + shares + comments) as engagements,
            impressions,
            mobile_app_install as installs,
            likes,
            inline_link_clicks as link_clicks,
            case
                when inline_link_clicks = 0 then 0 else (purchase / inline_link_clicks)
            end as post_click_conversions,
            case
                when views = 0 then 0 else (purchase / views)
            end as post_view_conversions,
            null as posts,
            purchase,
            complete_registration as registrations,
            purchase_value as revenue,
            shares,
            spend,
            purchase as total_conversions,
            null as video_views,
            ad_id,
            adset_id,
            campaign_id,
            channel,
            creative_id,
            null as placement_id

        from {{ ref("src_ads_creative_facebook_all_data") }}

    ),

    tiktok as (
        select
            date,
            add_to_cart,
            clicks,
            null as comments,
            null as engagements,
            impressions,
            rt_installs as installs,
            null as likes,
            null as link_clicks,
            null as post_click_conversions,
            null as post_view_conversions,
            null as posts,
            purchase,
            registrations,
            null as revenue,
            null as shares,
            spend,
            conversions as total_conversions,
            video_views,
            ad_id,
            null as adset_id,
            campaign_id,
            channel,
            null as creative_id,
            null as placement_id

        from {{ ref("src_ads_tiktok_ads_all_data") }}

    ),

    twitter as (

        select
            date,
            null as add_to_cart,
            clicks,
            comments,
            engagements,
            impressions,
            null as installs,
            likes,
            url_clicks as link_clicks,
            null as post_click_conversions,
            null as post_view_conversions,
            null as posts,
            null as purchase,
            null as registrations,
            null as revenue,
            retweets as shares,
            spend,
            null as total_conversions,
            video_total_views as video_views,
            null as ad_id,
            null as adset_id,
            campaign_id,
            channel,
            null as creative_id,
            null as placement_id
        from {{ ref("src_promoted_tweets_twitter_all_data") }}
    )
select *
from bing
union all
select *
from facebook
union all
select *
from tiktok
union all
select *
from twitter