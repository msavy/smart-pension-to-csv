# sp-to-csv

My accountant needed pension contribution data for the tax man, but Smart Pension (the pension provider) don't provide an export function. Their table of data is a load of `div` elements rather than an actual `table`, so I can't easily copy and paste it into a spreadsheet (everything goes into one column).

Rather than manually copying and pasting everything across a single value at a time (and getting it wrong), I decided to write a tiny Ruby script to do the job.

This script helps you get the Smart Pension data into CSV which will be more useful to you (and your accountant).

A couple of trivial steps are required to grab the data from the Smart Pension website using your browser's developer tools.

## Steps to get data

* Log into smart pension website (`https://www.smartpension.co.uk/`)
* Go to summary page (also called contributions, should look like `<someURL>/employee/contributions`).
* Open your developer tools and navigate to the network tab.
* You may need to refresh the page to capture the payloads.
* Look for the contributions payload ![image](https://user-images.githubusercontent.com/423513/146031285-e4cc392b-dccf-4603-b1c6-2e7cf80c8b63.png)
* Save the contributions JSON data as `actual-pension-contributions.json`.
* In the same directory, run `ruby process-pension-data.rb > pension-data.csv`
* `pension-data.csv` should have your data.
* If you have loads of entries, then you might need to fiddle with pagination. I didn't need to do it, so I'll leave that as an exercise for the reader :-).

Hope it's helpful to someone.

## Disclaimer

Use at your own risk. If something goes wrong, it's not my fault.
Double check the data, double check the code.
I'm not affiliated with Smart Pension, and I'm using their name under nominative fair use only.
I do not recommend Smart Pension.
I do not provide any financial or pension advice. Duh!
