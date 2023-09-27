class Command #Command

  def execute
  end

  def undo
  end

end


class CompleteOrderCommand < Command #ConcreteCommand1

  def initialize(chef, order)
    @chef = chef
    @order = order
  end

  def execute
    @chef.complete_order(@order)
  end

  def undo
    @chef.cancel_order(@order)
  end

end


class CancelOrderCommand < Command ##ConcreteCommand2

  def initialize(chef, order)
    @chef = chef
    @order = order
  end

  def execute
    @chef.cancel_order(@order)
  end

  def undo
    @chef.complete_order(@order)
  end

end


class Chef #Receiver - получатель

  def complete_order(order)
    puts "Заказ '#{order}' принят!"
  end

  def cancel_order(order)
    puts "Заказ '#{order}' отменен!"
  end

end


class Waiter #Invoker - инициатор||команда

  def initialize
    @history = []
  end

  def execute_order(order)
    order.execute
    @history.push(order)
  end

  def undo_last_order
    if @history.any?
      @history.pop.undo
    else
      puts 'Нет заказов для отмены'
    end
  end

end

#Client - отправитель
chef = Chef.new
waiter = Waiter.new

command1 = CompleteOrderCommand.new(chef, 'Juice and cake')
command2 = CompleteOrderCommand.new(chef, 'Salad, soup and water')

waiter.execute_order(command1)
waiter.execute_order(command2)

waiter.undo_last_order
waiter.undo_last_order
waiter.undo_last_order