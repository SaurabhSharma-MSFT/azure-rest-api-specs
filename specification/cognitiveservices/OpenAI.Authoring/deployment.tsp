import "@azure-tools/typespec-azure-core";
import "./models/deployment.models.tsp";
import "./serviceCustomizations.tsp";

namespace Azure.OpenAI;

using TypeSpec.Http;
using Azure.Core;

interface Deployments {
  #suppress "@azure-tools/cadl-azure-core/use-standard-operations" "This is an existing service, we have a non-conforming operation."
  @summary("Gets the list of deployments owned by the Azure OpenAI resource.")
  @doc("Gets the list of deployments owned by the Azure OpenAI resource.")
  @route("/deployments")
  @get
  // TODO: enum value types not supported in csharp emitter, change string literal to TypeDiscriminatorKnownValues enum when fixed
  ListDeployments is ServiceCustomizations.OpenAIListOperation<Deployment, "deployment">;

  @summary("""
Creates a new deployment for the Azure OpenAI resource according to the given
specification.
""")
  @doc("""
Creates a new deployment for the Azure OpenAI resource according to the given
specification.
""")
  CreateDeployment is ResourceCreateWithServiceProvidedName<
    Deployment,
    {
      response: Deployment
    }
  >;

  @summary("Gets details for a single deployment specified by the given deployment_id.")
  @doc("Gets details for a single deployment specified by the given deployment_id.")
  GetDeployment is ResourceRead<Deployment>;

  @summary("Updates the mutable details of the deployment with the given deployment_id.")
  @doc("Updates the mutable details of the deployment with the given deployment_id.")
  UpdateDeployment is ResourceCreateOrUpdate<Deployment>;

  @summary("Deletes the deployment specified by the given deployment_id.")
  @doc("Deletes the deployment specified by the given deployment_id.")
  DeleteDeployment is ResourceDelete<Deployment>;
}
