class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    @products = Product.all

    render json: @products
  end

  # GET /products/1
  def show

    render json: @product.to_json(:include => :tags)
  end

  # POST /products
  def create
  #      raise product_params.inspect

    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: api_v1_product_path(@product)
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    #raise product_params.inspect
    if product_params[:tags]
      product_params[:tags].map{|tag_title| tag = Tag.where(title: tag_title).first_or_create and (@product.tags << tag  if !@product.tags.include?(tag)) and pp "tag #{tag_title} add or update"}
      product_params.delete(:tags)
    end

    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.permit!
      params.fetch(:data).fetch(:attributes, {})
    end
end
