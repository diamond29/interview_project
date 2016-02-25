require_relative 'spec_helper'
require 'interview_project/sql_wrapper'

# don't want to get too crazy here...
# If we tested all these methods, we'd be mostly testing sql queries.
# If this was refactored to be more perfect it might be feasible, but this is more of a POC
describe InterviewProject::SQLWrapper do
  it 'has a color count query string' do
    expect(subject.class::COLOR_COUNT_QUERY).to match(/select \S+/i)
  end

  it 'has a DB connection to postgres' do
    expect(subject.class::DB).to be_an_instance_of Sequel::Postgres::Database
  end

  it 'has table definitions with names' do
    expect(subject.class::TABLES).to all include :name
  end
end
