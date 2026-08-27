# Stockholm Airbnb Investment Market Analysis 🇸🇪

A Full-Stack Data Analytics project evaluating the short-term rental housing market in Stockholm, Sweden. This project processes raw, "dirty" data to extract actionable business insights for real estate investors using a modern data stack.

##  Tech Stack & Architecture
* Data Extraction: Python (Pandas) - Automated downloading of raw Inside Airbnb datasets.
* Storage & Сleanup: PostgreSQL - Data warehousing, data type conversion, and anomaly handling.
* Data Transformation: SQL Views - Building analytical data marts using advanced aggregation ('WHERE' vs 'HAVING').
* BI Visualization: Power BI Desktop - Interactive cyberpunk-style Tech Dark dashboard with geospatial mapping and market segmentation.

##  Key Business Metrics Discovered
1. Market Volume: Tracked total active listings across all Stockholm districts to evaluate competition.
2. Estimated Annual Revenue: Calculated potential annual yields based on nightly prices and real occupancy rates (calculated in Swedish Krona - SEK).
3. Demand Proxy: Evaluated customer traffic density using average review counts per listing.
4. Value for Money Index: Discovered hidden investment gems (like Skärholmen ) by mapping the ratio of customer ratings to pricing.

##  Real-World Data Challenges Solved
* The Currency Trap: Discovered that Swedish Krona (SEK) values were natively present but often misinterpreted due to standard `$`. Verified and aligned business expectations.
* Geospatial Anomalies: Spotted a broken listing data point that geometrically teleported to Amsterdam due to corrupted latitude/longitude inputs. Handled anomaly logic using spatial SQL filtering.

##  Repository Structure
* "02_load_to_sql.py" - Python extraction script.
* "03_data_transformation.sql" - Production-ready SQL view queries.
* "Stockholm_Housing_Market_Analysis.pbix" - Power BI Dashboard source file.

## BUGS
   I've noticed that my project has 2 bugs
   1) The first one is the apartment from Amsterdam that lists as an apartment open for the renting in Sweden. I didnt managed to fix this bug due to the lack of experience in creasting pet-projects
   2) Second bug - when you try to click the dots in POWER BI, it doesnt shows apartments from the certain district, it just summarize the cost of the all apartments for rent in the distict. I also haven't managed to fix it too(
