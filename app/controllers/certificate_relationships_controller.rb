class CertificateRelationshipsController < ApplicationController
    def create
        user = User.find_by(email: params[:ced_email])
        cer = User.find_by(email: params[:cer_email])
        if(params[:ced_email] == params[:cer_email])
          flash[:danger] = "Please do not enter your own email!"
          redirect_to user
        elsif cer and user.certificater.include?(cer)
          flash[:danger] = "He/She has already certified you."
          redirect_to user
        elsif cer
          flash[:success] = "Invitation email has been sent, please wait for him/her certificate you."
          UserMailer.account_certification(cer,user).deliver_now
          redirect_to user
        else
          flash[:danger] = "Email not found!"
          redirect_to user
        end
    end
    
    def certificat
        certificater = User.find_by(email: params[:cer_email])
        certificated = User.find_by(email: params[:ced_email])
        certificater.certificate(certificated)
        flash[:success] = "Certificaiton Completed!"
        redirect_to root_url
    end
    
   def destroy
   end
end
