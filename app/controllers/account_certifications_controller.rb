class AccountCertificationsController < ApplicationController
    def edit
        certificater = User.find_by(params[:id])
        certificated = User.find_by(email: params[:ced_email])
        certificater.certificate(certificated)
        redirect_to root_url
    end
end
