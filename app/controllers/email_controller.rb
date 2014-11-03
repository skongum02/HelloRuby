require 'rubygems'
require 'json'

respond_to :html, :json

class EmailController < ApplicationController
  include ActionController::MimeResponds
  def create()
    
    respond_to do |format|
      format.json do
    end
    
    jsonData = params
    
    @json = JSON.parse(jsonData) if jsonData && jsonData.length >= 2
    
    #@json = JSON.parse()
    if @json == nil
      raise "JSON cannot be null"
    end
    
    
    if @json.has_key? 'Error'
      raise "Parsing JSON payload has errors"
    end
    
    unless @json.has_key?('to') && @json.has_key?('subject') && @json.has_key?('body')
      render nothing: true, status: :bad_request
      raise "Expecting keys of 'to', 'subject', and 'body'"
    end
    
    toAddr = @json['to']
    subject =  @json['subject']
    body = @json['body']
    
    unless toAddr.split('@').length > 1 && toAddr.split('.').length > 1
      raise "To needs to be a valid email address"
    end
    
    #max 78 characters for subject
    if subject.length > 78
      raise "Subject cannot be greater than 78 characters"
    end
    
    
    
    return @json
  end
    
end

