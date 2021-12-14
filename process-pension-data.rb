require 'json'

def process_contribution(contribution, all_rows) 
    this_row = []
    this_row[0] = contribution['state']
    this_row[1] = contribution['category']
    this_row[2] = contribution['starts_on']
    this_row[3] = contribution['ends_on']
    this_row[4] = contribution['pensionable_earnings']
    this_row[5] = contribution['company_amount']
    this_row[6] = contribution['employee_amount']
    this_row[7] = contribution['total_contributed'] = contribution['company_amount'] + contribution['employee_amount']

    all_rows << this_row;
end

raw_data = File.read('actual-pension-contributions.json');
data_as_json = JSON.parse(raw_data);

all_rows_output = [['State', 'Category', 'Starts on', 'Ends on', 'Pensionable Earnings', 'Employer Amount', 'Employee Amount', 'Total Contribution']]

data_as_json['contributions'].each { |contribution| process_contribution(contribution, all_rows_output) };

all_rows_output.each { |row|
    puts row.join(',') + "\n"
}