﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using GSoft.Dynamite.ValueTypes.Readers;
using GSoft.Dynamite.ValueTypes.Writers;

namespace GSoft.Dynamite.Binding
{
    /// <summary>
    /// Builds the schema of entity mapping details for all of an entity's properties
    /// tagged with the PropertyAttribute.
    /// </summary>
    public class EntitySchemaFactory : IEntitySchemaFactory
    {
        private IFieldValueWriter fieldValueWriter;
        private IFieldValueReader fieldValueReader;

        /// <summary>
        /// Creates an instance of <see cref="EntitySchemaFactory"/>
        /// </summary>
        /// <param name="fieldValueWriter">Field value writer</param>
        /// <param name="fieldValueReader">Field value reader</param>
        public EntitySchemaFactory(IFieldValueWriter fieldValueWriter, IFieldValueReader fieldValueReader)
        {
            this.fieldValueWriter = fieldValueWriter;
            this.fieldValueReader = fieldValueReader;
        }

        /// <summary>
        /// Gets the schema.
        /// </summary>
        /// <param name="type">The type.</param>
        /// <returns>The schema for the type.</returns>
        public IEntityBindingSchema GetSchema(Type type)
        {
            var schema = new EntityBindingSchema(type);

            foreach (var entityProperty in type.GetProperties(BindingFlags.Public | BindingFlags.Instance))
            {
                var customAttributes = entityProperty.GetCustomAttributes(typeof(PropertyAttribute), false);
                var propertyDetails = customAttributes.OfType<PropertyAttribute>().FirstOrDefault();
                if (propertyDetails != null)
                {
                    var valueKey = !string.IsNullOrEmpty(propertyDetails.PropertyName) ? propertyDetails.PropertyName : entityProperty.Name;
                    var valueWriter = this.fieldValueWriter.GetValueWriterForType(entityProperty.PropertyType);
                    var valueReader = this.fieldValueReader.GetValueReaderForType(entityProperty.PropertyType);

                    schema.PropertyConversionDetails.Add(
                        new EntityPropertyConversionDetail(
                            entityProperty, 
                            valueKey, 
                            propertyDetails.BindingType,
                            valueWriter,
                            valueReader));
                }
            }

            return schema;
        }
    }
}
