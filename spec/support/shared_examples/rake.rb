require 'rake'

shared_context "rake" do
  before(:all) do
    Rake.application.rake_require(task_path)
    # pre-load environment
    Rake::Task.define_task(:environment)
  end

  def rake
    Rake::Task[task_name].reenable # re-enable rake task (that only runs once)
    Rake::Task[task_name].invoke
  end

  def task_path
    # split on : because of namespacing
    "../../lib/tasks/#{task_name.split(":").first}"
  end

  def task_name
    # grabs the actual name of rake task from top-lvl description in spec
    self.class.top_level_description
  end
end