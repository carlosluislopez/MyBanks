class AccountTypesController < ApplicationController
  def index
    @accountType = AccountType.order(:title)
  end

  def edit
    @accountType = AccountType.find(params[:id])
  end

  def new
    @accountType = AccountType.new()
  end

  def create
    @accountType = AccountType.new(accountType_params)

    if @accountType.save
      redirect_to accountType_path, flash {notice: "Tipo de cuenta creada exitosamente"}
    else
      render :new
    end
  end

  def update
@client = Client.find(params[:id])

    if @client.update(client_params)
      redirect_to clients_path, 
        flash: {notice: "Cliente editado exitosamente"}
    else
      render :edit
    end

    @accountType = AccountType.find(:id)

    if @accountType.update(accountType_params)
      redirect_to accountType_path, flash {notice: "Tipo de cuenta editada exitosamente"}
    else
      render :new
    end

  end

private

    def accountType_params
        params.require(:accountType).permit(:title,:rate,
          :min_deposit)
    end

end
