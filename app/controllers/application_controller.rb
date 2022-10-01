class ApplicationController < ActionController::Base
  helper_method :current_user   #ヘルパーメソッドを定義する事でヴューで使用できる
  def Login?    #ログインしているか判定するメソッド
    if current_user.nil?  #カレントユーザーがニルという事はログイン出来ていない
      redirect_to login_path, alert: "You have to log in."
    end  
  end
  
  def already_login?    #もうログインしているならログイン画面や新規登録画面に活きたくない　ログインしているならマイページに遷移する
    unless current_user.nil?
      redirect_to user_path, notice: "You are already logged in."
    end  
  end  
  
  def current_user     #このカレントユーザーというメソッドはログインしている人の情報を取ってくるメソッド
    if session[:user_id]  #session[:user_id]に何かしら値が入っていれば下のアクションを実行する
      current_user ||= User.find(session[:user_id]) #カレントユーザーがニルでなかったら右側の値を入れる
    end                                             #ニルでなければ最終的にカレントユーザというメソッドにデータが入る
  end  
end
