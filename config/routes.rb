require 'api_constraints'

MyApp::Application.routes.draw do

  constraints subdomain: "www" do
    scope module: :front_end do
      resources :customers
    end
  end

  constraints subdomain: "admin" do
    scope module: :back_end do
      resources :customers
    end
  end

  constraints subdomain: "api" do
    scope module: :api do
      scope module: :v1, constraints: ApiConstraints.new(version: 1) do
        resources :customers, controller: "customers"
      end
      scope module: :v2, constraints: ApiConstraints.new(version: 2, default: :true) do
        resources :customers, controller: "customers"
      end
    end
  end
end
