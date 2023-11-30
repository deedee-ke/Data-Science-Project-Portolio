# Estimation of COVID-19 Pandemic in Kenya

This project aims to analyze the data on COVID-19 pandemic and estimate some key indicators, such as the number of infected, recovered, and deceased individuals, the percentage of infected population, the reproduction number, and the trend of new cases. The project uses data from the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University, which is updated daily and available on [this GitHub repository](^1^).

## Data Loading and Pre-processing

The project uses pandas library to load and manipulate the data from the following CSV files:

- `time_series_covid19_confirmed_global.csv`: contains the number of confirmed cases for each country and/or province on each date.
- `time_series_covid19_recovered_global.csv`: contains the number of recovered cases for each country and/or province on each date.
- `time_series_covid19_deaths_global.csv`: contains the number of deaths for each country and/or province on each date.
- `UID_ISO_FIPS_LookUp_Table.csv`: contains the population and other information for each country and/or province.

The project also uses matplotlib library to plot the data and visualize the results. The project defines a function `mkframe` that takes a country name as an argument and returns a DataFrame with the following columns:

- `infected`: the number of confirmed cases on each date.
- `recovered`: the number of recovered cases on each date.
- `deaths`: the number of deaths on each date.
- `ninfected`: the number of new cases on each date, computed by taking the difference of `infected` column.
- `ninfav`: the 7-day rolling average of `ninfected` column, to smooth out the fluctuations in data.
- `pinfected`: the percentage of infected population on each date, computed by dividing `infected` column by the population of the country.
- `Rt`: the reproduction number on each date, computed by taking the ratio of the sum of `ninfected` values in the last 4 days to the sum of `ninfected` values in the previous 4 days.

## Data Analysis and Visualization

The project uses the `mkframe` function to create DataFrames for different countries and plot the data using matplotlib. The project also uses numpy library to perform some numerical operations on the data, such as replacing NaN or inf values, and computing the derivative of `ninfected` column. The project shows the following graphs for each country:

- The number of infected, recovered, and deceased individuals over time.
- The number of new cases and the 7-day rolling average over time.
- The percentage of infected population over time.
- The reproduction number over time, with a horizontal line at 1 to indicate the threshold for epidemic spread.
- The derivative of new cases over time, with a horizontal line at 0 to indicate the trend of the pandemic.

The project also compares the graphs of different countries to see the similarities and differences in their pandemic situations.

## Example Output

The following are some example outputs of the project for Kenya:

![infected, recovered, and deaths](https://github.com/deedee-ke/Data-Science-Project-Portolio/blob/main/Data%20Analysis/Covid-19/infected,%20recovered,%20and%20deaths.png?raw=true)

![new cases and 7-day rolling average](https://github.com/deedee-ke/Data-Science-Project-Portolio/blob/main/Data%20Analysis/Covid-19/new%20cases%20and%207-day%20rolling%20average.png?raw=true)

## References

- [Sliding SIR Model for Rt Estimation during COVID Pandemic](^7^), blog post by Dmitry Soshnikov
- [T.Petrova, D.Soshnikov, A.Grunin. Estimation of Time-Dependent Reproduction Number for Global COVID-19 Outbreak](^8^). Preprints 2020, 2020060289 (doi: 10.20944/preprints202006.0289.v1)
- [Code for the above paper on GitHub](^9^)
