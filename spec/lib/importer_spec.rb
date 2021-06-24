require 'rails_helper'

RSpec.describe Lattes::Importer do
  before :all do
    # Lib Object instantiate
    @lattes_importer = Lattes::Importer.instance

    # Get Lattes XML Sample
    files_dir = "#{File.dirname(__FILE__)}/sample_lattes"
    researcher_cv_file = "#{files_dir}/ex-cv-lattes-lourdes.xml"
    @sample_researcher_cv = File.read(researcher_cv_file, encoding: 'iso-8859-1')
    @sample_researcher_cv.encoding

    # f = File.open(researcher_cv_file, 'r')
    # @sample_researcher_cv = ''
    # f.each_line do |line|
    #   @sample_researcher_cv += line
    # end
  end

  describe 'Import Lattes XML to ResearchersDB Structure' do
    it 'might convert Lattes XML into Dict' do
      @lattes_importer.get_single_cv @sample_researcher_cv
      expect(true).to be_truthy
    end
  end
end
