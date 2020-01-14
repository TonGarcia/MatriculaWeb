class SubjectsController < ApplicationController
  before_action :set_aux_vars
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)
    @subject.user_id = @current_user.id

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        @subject.user_id = @current_user.id
        format.html { redirect_to @subject, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_aux_vars
      @hours = Array(9..21)
      @weekdays = %w(Seg Ter Qua Qui Sex)
      @schedule_options = []
      @hours.each do |hour|
        @weekdays.each do |weekday|
          @schedule_options << "#{weekday} - #{SubjectsHelper.to_hour(hour)}"
        end
      end

      @knowledge_areas = KnowledgeArea.where.not(knowledge_area_id: nil)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
      @current_obj = @subject
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      aux_p = params.require(:subject).permit(:name, :description, :workload, :online_link, :knowledge_area_id)
      aux_p[:user_id] = @current_user.id
      class_schedule_str = params[:subject][:class_schedule].join()
      class_schedule_str.gsub!('01', '1')
      aux_p[:class_schedule] = class_schedule_str
      aux_p
    end
end
