module Employee
  class Data < Grape::API
    resource :data do

      desc 'All list Employee'

      get do
        MyData.all
      end

      desc 'Add new an employee'

      params do
        requires :name, type: String
        requires :address, type: String
        requires :age, type: Integer
      end

      post do
        MyData.create!({
                          name:params[:name],
                          address:params[:address],
                          age:params[:age]
                      })
      end

      desc 'Delete an employee'

      params do
        requires :id, type: String
      end

      delete ':id' do
        MyData.find(params[:id]).destroy!
      end

      desc 'Update an employee'

      params do
        requires :id, type: String
        requires :address, type: String
        requires :age, type: Integer
      end
      put ':id' do
        MyData.find(params[:id]).update({address: params[:address],age: params[:age]})
      end

    end
  end
end