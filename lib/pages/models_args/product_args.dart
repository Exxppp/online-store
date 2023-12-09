class ProductArgs {
  final int? categoryId;
  final String title;

  const ProductArgs({
    this.categoryId,
    this.title = 'Товары',
  });
}
