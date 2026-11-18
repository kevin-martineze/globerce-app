import 'package:flutter/material.dart';

import 'package:globerce_app/ui/core/tokens/colors.dart';
import 'package:globerce_app/ui/core/tokens/spacing.dart';

/// Una opción de [GFilterChips].
class GFilterOption<T> {
  const GFilterOption({required this.value, required this.label});

  final T value;
  final String label;
}

/// Filtros en píldora con scroll horizontal. Uno activo a la vez.
///
/// La fila se sale de los márgenes de la pantalla para que se note que hay
/// más filtros a la derecha.
class GFilterChips<T> extends StatelessWidget {
  const GFilterChips({
    super.key,
    required this.options,
    required this.selected,
    required this.onSelect,
  });

  final List<GFilterOption<T>> options;
  final T selected;
  final ValueChanged<T> onSelect;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        children: [
          for (final (index, option) in options.indexed) ...[
            if (index > 0) const SizedBox(width: Space.sm),
            _chip(option, colors, textTheme),
          ],
        ],
      ),
    );
  }

  Widget _chip(
    GFilterOption<T> option,
    GloberceColors colors,
    TextTheme textTheme,
  ) {
    final active = option.value == selected;

    return Semantics(
      key: ValueKey(option.value),
      button: true,
      selected: active,
      child: Material(
        color: active ? colors.foreground : Colors.transparent,
        shape: StadiumBorder(
          side: BorderSide(color: active ? colors.foreground : colors.input),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: active ? null : () => onSelect(option.value),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 40),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Space.lg,
                vertical: Space.sm,
              ),
              child: Center(
                widthFactor: 1,
                child: Text(
                  option.label,
                  style: textTheme.labelLarge?.copyWith(
                    color: active ? colors.background : colors.foreground,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
