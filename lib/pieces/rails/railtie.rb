module Pieces
  module Rails
    def self.install_to_slim!
      shortcut = Slim::Parser.options[:shortcut]
      shortcut['@']  = { attr: 'data-pid' }
      shortcut['@@'] = { attr: 'data-component' }
      Slim::Engine.options[:merge_attrs].merge!('data-pid' => ' ', 'data-component' => ' ')
    end

    class Railtie < ::Rails::Railtie
      initializer "pieces.slim" do
        Pieces::Rails.install_to_slim! if defined?(Slim::Parser)
      end
    end
  end
end
