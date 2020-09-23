
abstract class Product {
  String name;
  double price;
}

class ProductA extends Product {
  @override
  String get name => '辣鸡';

  @override
  double get price => 120;

}

class ProductB extends Product {
  @override
  String get name => '莲藕';

  @override
  double get price => 25;
}

class RawMaterial {
  final String milk;
  final String fruit;
  final String sugar;
  RawMaterial({
    this.milk,
    this.fruit,
    this.sugar
  });
}

abstract class ProductFactory<T> {
  createProduct(T material);
}

class FactoryA extends ProductFactory<RawMaterial> {
  @override
  createProduct(RawMaterial material) {
    ProductA product = ProductA()..name = material.fruit + material.milk + material.sugar;
    return product;
  }
}

class FactoryB extends ProductFactory<RawMaterial> {
  @override
  ProductB createProduct(RawMaterial material) {
    return ProductB();
  }
}


class Strategy {
  void strategyImplementation() {}
}

class StrategyA implements Strategy {
  @override
  void strategyImplementation() {
    print('正在执行 策略 A');
  }
}

abstract class StrategyFactory<T> {
  T createStrategy();
}

class StrategyFactoryA extends StrategyFactory<StrategyA> {
  @override
  StrategyA createStrategy() {
    return StrategyA();
  }
}

// 封装策略，屏蔽高层模块、算法对策略的直接访问 开闭原则
class StrategyContext {
  Strategy strategy;
  StrategyContext({
    this.strategy,
  });
  
  doStrategy() {
    strategy.strategyImplementation();
  }
}