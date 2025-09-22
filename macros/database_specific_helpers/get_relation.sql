{% macro get_relation(relation_name) %}
    {% if execute %}
        {% set model_get_relation_node = graph.nodes.values() | selectattr('name', 'equalto', relation_name) | first %}
        {% do log("model_get_relation_node: " ~ model_get_relation_node, info=True) %}
        {% set relation = api.Relation.create(
            database = model_get_relation_node.database,
            schema = model_get_relation_node.schema,
            identifier = model_get_relation_node.alias
        )
        %}
        {% do return(relation) %}
    {% else %}
        {% do return(api.Relation.create()) %}
    {% endif %}
{% endmacro %}
