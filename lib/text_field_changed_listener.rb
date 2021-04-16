# @AppService appService
require_relative "#{$appService.getApp.getBaseDirectory}/plugins/JRuby/imagej.rb"

require_relative "./config.rb"

java_import "javax.swing.event.DocumentListener"

class TextFieldChangedListener
  include DocumentListener

  def initialize(text_field, config_attribute)
    @text_field = text_field
    @config_attribute = config_attribute
    @config = Config.instance
  end

  def changed_update
    self.value = text_field.get_text
  end

  def remove_update
    self.value = text_field.get_text
  end

  def insert_update
    self.value = text_field.get_text
  end

  private

  def value=(value)
    @config.send("#{@config_attribute}=", value)
  end
end