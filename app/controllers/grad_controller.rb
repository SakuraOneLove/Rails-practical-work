# frozen_string_literal: true

# myclass
class GradController < ApplicationController
  def input; end

  def main; end

  def newsx; end

  def output
    if params[:text].nil?
      var = Article.find(params[:id].to_i)
      @result = var.res
      @auid = var.user_id
      @arid = params[:id]
    elsif Article.exists?(header: params[:text])
      var = Article.find_by(header: params[:text])
      @result = var.res
      @auid = var.user_id
      @arid = var.id
    else
      @result = t('eror')
    end
  end

  def addnewar
    @ar = Article.new(header: params[:header], res: params[:rec][:text], img: params[:reff], nenbl: false)
    if @ar.header.empty? || @ar.res.empty? || @ar.img.empty?
      flash[:alert] = t('add_err')
      redirect_to grad_input_path
    else
      @ar.user_id = User.find_by(email: current_user.email)[:id]
      @ar.save
      redirect_to "/grad/output?id=#{Article.last.id}"
    end
  end

  def deletear
    @ar = Article.find(params[:arid])
    @ar.delete
    redirect_to grad_main_path
  end

  private

  def article_params
    params.require(:article).permit(:body)
  end
end
