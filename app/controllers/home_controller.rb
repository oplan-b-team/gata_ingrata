class HomeController < ApplicationController
  def main
    @date = Date.current.strftime('%Y/%m/%d')
    @time = Time.now
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @date = Date.current.strftime('%Y/%m/%d')
    @task.date = @date
    @task.save
    redirect_to("/main")
  end

  def finish
    #tasksテーブルの最後のレコードを取得
      @f = Task.last
    #現在時間を取得
      @time = Time.now
    #finish_timeカラムに現在時間を代入
      @f.finish_time = @time
    #現在時刻(作業終了時刻) - 作業開始時刻　=　工数時間
      @m = Time.at(@time - @f.created_at).utc.strftime('%X')
    #man_hourカラムに工数時間を代入
      @f.man_hour = @m
    @f.save
    redirect_to('/main')
  end

  private
    def task_params
      params.require(:task).permit(:work_id)
    end

end